class Vdisplay < Formula
  desc "Virtual displays and monitor-layout management for macOS"
  homepage "https://github.com/pacifistazero/vdisplay"
  url "https://github.com/pacifistazero/vdisplay/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "6e666f2c496831bda0948c7c6c304fc16c195e06e0673eeb810d9d496abeb98e"
  license "MIT"
  head "https://github.com/pacifistazero/vdisplay.git", branch: "main"

  # displayplacer powers the monitor-layout save/restore feature.
  depends_on "displayplacer"
  # m1ddc powers physical-monitor brightness control over DDC.
  depends_on "m1ddc"
  depends_on :macos

  def install
    system "swift", "build", "--configuration", "release", "--disable-sandbox"
    bin.install ".build/release/vdisplay"
    bin.install ".build/release/vdisplaybar"
  end

  test do
    assert_match "virtual displays for macOS", shell_output("#{bin}/vdisplay --help")
  end
end
