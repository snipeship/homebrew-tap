class Rexkit < Formula
  desc "Zellij/tmux-style keys, a session manager and a file picker for Rex"
  homepage "https://github.com/snipeship/rexkit"
  url "https://github.com/snipeship/rexkit/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "fe48b265097bf65b7a165b8b6a163c193cef8fedf58b3d3208fc3545c6ced93a"
  license "MIT"
  head "https://github.com/snipeship/rexkit.git", branch: "main"

  depends_on "go" => :build
  depends_on :macos

  def install
    # rexkit installs the Lua layer and binary of opt/ (stable across
    # upgrades): Rex's init.lua loads opt_libexec/"lua/init.lua", which runs
    # opt_libexec/"bin/rexkit".
    ldflags = %W[
      -s -w
      -X main.releaseVersion=#{version}
      -X rexkit/internal/install.Packaged=#{opt_libexec}
    ]
    system "go", "build", *std_go_args(ldflags:, output: libexec/"bin/rexkit"), "./cmd/rexkit"
    libexec.install "lua"
    rm_r libexec/"lua/tests"
    bin.install_symlink libexec/"bin/rexkit"
  end

  def caveats
    <<~EOS
      To load rexkit in Rex (your init.lua is backed up first):
        rexkit install

      After `brew upgrade rexkit`, run `rexkit install` again so Rex
      reloads the new version.

      To remove rexkit, take it out of Rex first, which restores your
      config, then uninstall it:
        rexkit uninstall && brew uninstall rexkit
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rexkit version")
    assert_path_exists opt_libexec/"lua/init.lua"
  end
end
