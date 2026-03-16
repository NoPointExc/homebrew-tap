class Dbc < Formula
  desc "Dollar Calculator CLI Tool"
  homepage "https://github.com/NoPointExc/dbc"
  url "https://github.com/NoPointExc/dbc/archive/refs/heads/main.tar.gz"
  version "0.1.10" # Manually setting version since we're tracking main
  sha256 "3f6679071352575831444c77d8b1566ec02e85819f0bff68feba2594a44a74fd"
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
