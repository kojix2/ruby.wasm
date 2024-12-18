#!/bin/bash
set -eu

if [ $# -ne 1 ]; then
    echo "Usage: $0 <dist_dir>"
    exit 1
fi

package_dir="$(cd "$(dirname "$0")/.." && pwd)"
dist_dir="$1"
repo_dir="$package_dir/../../../"

mkdir -p "$dist_dir"

cp "$repo_dir/LICENSE" "$dist_dir/LICENSE"
cp "$repo_dir/NOTICE" "$dist_dir/NOTICE"
