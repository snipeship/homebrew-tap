class Etz < Formula
  desc "CLI for coordinating git worktrees across multi-repo parent directories"
  homepage "https://github.com/snipeship/etz"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/snipeship/etz/releases/download/v0.3.0/etz-0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "30ed303297be31d82ccbcbc3b138d4f2f37363070b32b347715f5b9305c1f603"
    else
      url "https://github.com/snipeship/etz/releases/download/v0.3.0/etz-0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "a4d56c645e6d278d75eae74c501c63ac2441fe07298c12a27b2d7f4621ef4442"
    end
  end

  on_linux do
    url "https://github.com/snipeship/etz/releases/download/v0.3.0/etz-0.3.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "cd2187def6bbcbbcd8ac48176440e8b776766a892c6acce32f5d1ac23596c11d"
  end

  def install
    bin.install "etz"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/etz --version")
  end
end
