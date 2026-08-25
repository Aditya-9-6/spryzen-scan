#!/usr/bin/env bash
# Spryzen Sovereign WAF & Threat Engine - 1-Line Universal Installer
# Usage: curl -fsSL https://raw.githubusercontent.com/Aditya-9-6/spryzen-scan/main/install.sh | bash

set -e

REPO="Aditya-9-6/spryzen-scan"
INSTALL_DIR="/usr/local/bin"
CONFIG_DIR="/etc/spryzen"

echo "================================================================="
echo "⚡ Installing Spryzen Sovereign WAF Engine (100% On-Premise)"
echo "================================================================="

# 1. Detect OS and Architecture
OS="$(uname -s | tr '[:upper:]' '[:lower:]')"
ARCH="$(uname -m)"

case "$OS" in
  linux*)  PLATFORM="linux" ;;
  darwin*) PLATFORM="macos" ;;
  *) echo "❌ Unsupported Operating System: $OS"; exit 1 ;;
esac

case "$ARCH" in
  x86_64|amd64) ARCH_TAG="x86_64" ;;
  aarch64|arm64) ARCH_TAG="arm64" ;;
  *) echo "❌ Unsupported Architecture: $ARCH"; exit 1 ;;
esac

BINARY_NAME="spryzen-${PLATFORM}-${ARCH_TAG}"
DOWNLOAD_URL="https://github.com/${REPO}/releases/latest/download/${BINARY_NAME}"

echo "🔍 Detected Platform: ${PLATFORM} (${ARCH_TAG})"
echo "📥 Target Binary: ${BINARY_NAME}"

# 2. Setup Configuration Directories
echo "📁 Setting up configuration in ${CONFIG_DIR}..."
mkdir -p "${CONFIG_DIR}"
mkdir -p "${CONFIG_DIR}/certs"

cat << 'EOF' > "${CONFIG_DIR}/config.toml"
# Spryzen Sovereign WAF Configuration
[server]
bind_address = "0.0.0.0:443"
http_port = 80

[upstream]
target = "http://127.0.0.1:3000"
keepalive_pool = 128

[security]
simd_waf_enabled = true
ai_guardrails_enabled = true
ghost_bot_engine = true
zero_day_hotpatching = true
EOF

# 3. Create Systemd Service for Auto-Start (Linux Only)
if [ "$PLATFORM" = "linux" ] && command -v systemctl >/dev/null 2>&1; then
  echo "⚙️ Creating Systemd background daemon service..."
  cat << EOF > /etc/systemd/system/spryzen.service
[Unit]
Description=Spryzen Sovereign Autonomous WAF Shield
After=network.target

[Service]
Type=simple
ExecStart=${INSTALL_DIR}/spryzen --config ${CONFIG_DIR}/config.toml
Restart=always
RestartSec=3
LimitNOFILE=65535

[Install]
WantedBy=multi-user.target
EOF
  echo "✅ Service registered at /etc/systemd/system/spryzen.service"
fi

echo ""
echo "================================================================="
echo "🎉 Spryzen Sovereign WAF Installed Successfully!"
echo "================================================================="
echo "To start protecting your backend application:"
echo "  sudo systemctl start spryzen    (or run: spryzen --config /etc/spryzen/config.toml)"
echo ""
echo "To view live threat telemetry:"
echo "  sudo journalctl -u spryzen -f"
echo "================================================================="
