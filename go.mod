module github.com/yourusername/SaveAny-Bot

go 1.22

require (
	github.com/celestix/gotgproto v1.0.0-beta18
	github.com/duke-git/lancet/v2 v2.3.4
	github.com/gabriel-vasile/mimetype v1.4.4
	github.com/gotd/td v0.109.0
	github.com/ncruces/go-sqlite3 v0.17.1
	github.com/ncruces/go-sqlite3/gormlite v0.17.1
	github.com/redis/go-redis/v9 v9.6.1
	github.com/rclone/rclone v1.68.1
	github.com/spf13/viper v1.19.0
	github.com/stoewer/go-strcase v1.3.0
	github.com/urfave/cli/v2 v2.27.4
	go.uber.org/zap v1.27.0
	gorm.io/gorm v1.25.12
)

require (
	github.com/AnimeKaizoku/cacher v1.0.1 // indirect
	github.com/cenkalti/backoff/v4 v4.3.0 // indirect
	github.com/cespare/xxhash/v2 v2.3.0 // indirect
	github.com/cpuguy83/go-md2man/v2 v2.0.4 // indirect
	github.com/dgryski/go-rendezvous v0.0.0-20200823014737-9f7001d12a5f // indirect
	github.com/fsnotify/fsnotify v1.7.0 // indirect
	github.com/go-faster/errors v0.7.1 // indirect
	github.com/go-faster/jx v1.1.0 // indirect
	github.com/go-faster/xor v1.0.0 // indirect
	github.com/gotd/ige v0.2.2 // indirect
	github.com/gotd/neo v0.1.5 // indirect
	github.com/hashicorp/hcl v1.0.0 // indirect
	github.com/jinzhu/inflection v1.0.0 // indirect
	github.com/jinzhu/now v1.1.5 // indirect
	github.com/klauspost/compress v1.17.10 // indirect
	github.com/magiconair/properties v1.8.7 // indirect
	github.com/marusama/semaphore v0.0.0-20190110074507-6952cef993b2 // indirect
	github.com/mitchellh/mapstructure v1.5.0 // indirect
	github.com/pelletier/go-toml/v2 v2.2.3 // indirect
	github.com/pkg/errors v0.9.1 // indirect
	github.com/russross/blackfriday/v2 v2.1.0 // indirect
	github.com/sagikazarmark/locafero v0.4.0 // indirect
	github.com/sagikazarmark/slog-shim v0.1.0 // indirect
	github.com/segmentio/asm v1.2.0 // indirect
	github.com/sourcegraph/conc v0.3.0 // indirect
	github.com/spf13/afero v1.11.0 // indirect
	github.com/spf13/cast v1.7.0 // indirect
	github.com/spf13/pflag v1.0.5 // indirect
	github.com/subosito/gotenv v1.6.0 // indirect
	github.com/xrash/smetrics v0.0.0-20240521201337-686a1a2994c1 // indirect
	go.opentelemetry.io/otel v1.29.0 // indirect
	go.opentelemetry.io/otel/trace v1.29.0 // indirect
	go.uber.org/multierr v1.11.0 // indirect
	golang.org/x/crypto v0.27.0 // indirect
	golang.org/x/net v0.29.0 // indirect
	golang.org/x/sync v0.8.0 // indirect
	golang.org/x/sys v0.25.0 // indirect
	golang.org/x/text v0.18.0 // indirect
	gopkg.in/ini.v1 v1.67.0 // indirect
	gopkg.in/yaml.v3 v3.0.1 // indirect
)

// Personal fork - studying how the bot handles rclone storage backends
// Upstream: https://github.com/krau/SaveAny-Bot
//
// Notes:
//   - Tracking rclone v1.68.1 to understand how remote backend selection works
//   - TODO: look into whether gotgproto beta18 has any breaking changes from beta17
//     that affect the file download handler
//   - Checked gotgproto beta18 changelog: the main breaking change from beta17 is
//     that UpdateHandler now requires an explicit context cancellation pattern;
//     the file download handler in this project appears to handle it correctly.
//   - NOTE: considering pinning golang.org/x/crypto to v0.28.0 once upstream
//     bumps it; v0.27.0 has a minor issue with chacha20poly1305 on 32-bit targets
//     that doesn't affect my use case but worth keeping an eye on.
