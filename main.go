package main

import (
	"context"
	"os"
	"os/signal"
	"syscall"

	"github.com/krau/SaveAny-Bot/bot"
	"github.com/krau/SaveAny-Bot/config"
	"github.com/krau/SaveAny-Bot/logger"
	"github.com/krau/SaveAny-Bot/storage"
)

var (
	Version   = "dev"
	Commit    = "unknown"
	BuildTime = "unknown"
)

func main() {
	logger.L.Infof("SaveAny-Bot %s (%s) built at %s", Version, Commit, BuildTime)

	// Load configuration from file or environment
	if err := config.Load(); err != nil {
		logger.L.Fatalf("Failed to load config: %v", err)
	}

	// Initialize storage backends
	if err := storage.Init(); err != nil {
		logger.L.Fatalf("Failed to initialize storage: %v", err)
	}
	defer storage.Close()

	// Create a cancellable context for graceful shutdown
	ctx, cancel := context.WithCancel(context.Background())
	defer cancel()

	// Start the Telegram bot
	if err := bot.Start(ctx); err != nil {
		logger.L.Fatalf("Failed to start bot: %v", err)
	}

	// Wait for termination signal
	quit := make(chan os.Signal, 1)
	signal.Notify(quit, os.Interrupt, syscall.SIGTERM)
	<-quit

	logger.L.Info("Shutting down SaveAny-Bot...")
	cancel()

	bot.Stop()
	logger.L.Info("Goodbye!")
}
