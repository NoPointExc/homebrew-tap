class Dbc < Formula
  desc "Dollar Calculator CLI Tool"
  homepage "https://github.com/NoPointExc/dbc"
  url "https://github.com/NoPointExc/dbc/archive/refs/heads/master.tar.gz"
  version "0.1.1" # Manually setting version since we're tracking main
  sha256 "5962b18f9da2514ee5ebff9f41f89681e8cd5e15df58f91d9a292d6ab182a560"
  license "MIT"

  depends_on "rust" => :build

  def install
    # Ensure we are in the dbc directory if needed, but since the repo IS the tool, we just build
    system "cargo", "install", *std_cargo_args
  end

  test do
    # Simple test to verify the binary works
    assert_match "$150.00", shell_output("#{bin}/dbc '$100.00 + $50'").strip
  end
end
