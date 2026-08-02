class Tracce < Formula
  desc "macOS kernel-event tracer for Claude Code sessions"
  homepage "https://github.com/chungchihhan/tracce"
  url "https://github.com/chungchihhan/tracce/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "e7fc202a6e99c0281a019a9e7d12ac4163d001efc2ca77674b693db92abbed47"
  license "MIT"
  head "https://github.com/chungchihhan/tracce.git", branch: "main"

  depends_on "rust" => :build
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args
  end

  def caveats
    <<~EOS
      ████████╗██████╗  █████╗  ██████╗ ██████╗███████╗
      ╚══██╔══╝██╔══██╗██╔══██╗██╔════╝██╔════╝██╔════╝
         ██║   ██████╔╝███████║██║     ██║     █████╗
         ██║   ██╔══██╗██╔══██║██║     ██║     ██╔══╝
         ██║   ██║  ██║██║  ██║╚██████╗╚██████╗███████╗
         ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═════╝╚══════╝

      tracce reads kernel events via `sudo /usr/bin/eslogger`, so it prompts for
      your password on start. eslogger ships with macOS 13+. Your terminal app
      may also need Full Disk Access (System Settings > Privacy & Security).
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tracce --version")
  end
end
