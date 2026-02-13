class Etz < Formula
  desc "CLI for coordinating git worktrees across multi-repo parent directories"
  homepage "https://github.com/snipeship/etz"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/snipeship/etz/releases/download/v0.1.0/etz-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "80bd6f0cec60df56d27d76a9c63b9c52ef00184c0dc0f0c476caba0b6465ec63"
    else
      url "https://github.com/snipeship/etz/releases/download/v0.1.0/etz-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "036251e6653952552ceb4ae748c023508f71ddc4ab43657b56b31e8e182b2a96"
    end
  end

  on_linux do
    url "https://github.com/snipeship/etz/releases/download/v0.1.0/etz-0.1.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d572de29b99280feac5c856b608b7f80d48c60a6a07a8daceb78bc7126f9e5fb"
  end

  def install
    bin.install "etz"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/etz --version")
  end
end
