class Tracce < Formula
  desc "macOS kernel-event tracer for Claude Code sessions"
  homepage "https://github.com/chungchihhan/tracce"
  url "https://github.com/chungchihhan/tracce/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "c78c7e9ebf0132ad2234943dbf1aa8d72056117084fdb806131822d133816676"
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
