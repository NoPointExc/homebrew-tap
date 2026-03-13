class Dbc < Formula
  desc "Dollar Calculator CLI Tool"
  homepage "https://github.com/NoPointExc/dbc"
  url "https://github.com/NoPointExc/dbc/archive/refs/heads/main.tar.gz"
  version "0.1.2" # Manually setting version since we're tracking main
  sha256 "58850cc323fcce8659379b22157738ff852685a8a5682bafe87e2f8d32928027"
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
