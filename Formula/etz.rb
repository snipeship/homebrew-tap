class Etz < Formula
  desc "CLI for coordinating git worktrees across multi-repo parent directories"
  homepage "https://github.com/snipeship/etz"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/snipeship/etz/releases/download/v0.2.0/etz-0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "fa51d147528234a07d948f3b48bd580b8d4d9ab7087621d60719cf0bdbdb3b07"
    else
      url "https://github.com/snipeship/etz/releases/download/v0.2.0/etz-0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "2d51d5be10c834efdfe394b1c02685da7609d4e99787a67686f2cb2bc04cf197"
    end
  end

  on_linux do
    url "https://github.com/snipeship/etz/releases/download/v0.2.0/etz-0.2.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e90ecf758b67c90d529c3caee9da081235bd1aba7ef31bded60400073e859c5a"
  end

  def install
    bin.install "etz"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/etz --version")
  end
end
