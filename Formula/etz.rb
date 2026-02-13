class Etz < Formula
  desc "CLI for coordinating git worktrees across multi-repo parent directories"
  homepage "https://github.com/snipeship/etz"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/snipeship/etz/releases/download/v0.1.0/etz-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "97be6c35857ed8b9cf1d196b244322bba451b118be8b36472f498c2feb5dc639"
    else
      url "https://github.com/snipeship/etz/releases/download/v0.1.0/etz-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "127607fc515cab7cb6b57b522c59700ab74cb9694fc2f3ed008f66e0b2398d46"
    end
  end

  on_linux do
    url "https://github.com/snipeship/etz/releases/download/v0.1.0/etz-0.1.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "04be998d3232da7a474d4b43d862f1a1915ee419d66e1598ee1b4a290e7bf6ba"
  end

  def install
    bin.install "etz"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/etz --version")
  end
end
