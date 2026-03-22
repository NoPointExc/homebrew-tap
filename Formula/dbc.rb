class Dbc < Formula
  desc "Dollar Calculator with Real-Time Stock Prices"
  homepage "https://github.com/NoPointExc/dbc"
  url "https://github.com/NoPointExc/dbc/archive/refs/tags/v2.0.0.tar.gz"
  version "2.0.0"
  sha256 "e1da63368aaef2ffb50353516c8979b526237f94d2efdba3c8dabe6014492bfb"
  license "MIT"

  depends_on "rust" => :build

  def install
    # Build from the dbc directory within the archive if it's there
    # GitHub archives often have a top-level directory named after the repo and tag
    # If the workspace structure is flat, we just build from the root
    system "cargo", "install", *std_cargo_args
  end

  test do
    # Verify basics
    assert_match "$150.00", shell_output("#{bin}/dbc '$100.00 + $50'").strip
    # Verify stock symbol tokenization (network fetch might fail in sandbox, so we just check it runs)
    # But for Homebrew test, we prefer something that doesn't need internet
    assert_match "$200.00", shell_output("#{bin}/dbc 'max($100, $200)'").strip
  end
end
