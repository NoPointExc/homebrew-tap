class Dbc < Formula
  desc "Dollar Calculator CLI Tool"
  homepage "https://github.com/NoPointExc/dbc"
  url "https://github.com/NoPointExc/dbc/archive/refs/heads/master.tar.gz"
  version "0.1.2" # Manually setting version since we're tracking main
  sha256 "812fa2cb136c818ee81ba4772e6751ee2524e82982c750a5eeab0fe6f0799034"
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
