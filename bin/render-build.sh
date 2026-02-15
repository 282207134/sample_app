#!/usr/bin/env bash
# exit on error
set -o errexit

# 部署时必须安装 production 组（含 pg），覆盖本地 .bundle/config 的 without production
unset BUNDLE_WITHOUT
bundle config unset without 2>/dev/null || true

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rails db:migrate
