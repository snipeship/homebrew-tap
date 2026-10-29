class Rexkit < Formula
  desc "Zellij/tmux-style keys, a session manager and a file picker for Rex"
  homepage "https://github.com/snipeship/rexkit"
  url "https://github.com/snipeship/rexkit/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "f6d5667b9c2023d185c2ad872dd5838a0c8d89e90f9f83cac839d57d7f6a985b"
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
    # The Lua layer reports its version (to rexkit host status and doctor on
    # other machines) from VERSION next to lua/, as a release tarball has it.
    (libexec/"VERSION").write "#{version}\n"
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
