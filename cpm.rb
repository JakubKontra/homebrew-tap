class Cpm < Formula
  desc "Claude Profile Manager — manage multiple Claude Code accounts"
  homepage "https://github.com/jakubkontra/claude-profile-manager"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/JakubKontra/claude-profile-manager/releases/download/v0.1.1/cpm_darwin_arm64"
      sha256 "d7779fccb712588f290b482ba2315a3f17294cacfcc859f3ddd3d80540c2af87"
    end

    on_intel do
      url "https://github.com/JakubKontra/claude-profile-manager/releases/download/v0.1.1/cpm_darwin_amd64"
      sha256 "bb6eef807e4b14ada8becb7ec096672a1552ebaaddb976769385b03688feb3fe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/JakubKontra/claude-profile-manager/releases/download/v0.1.1/cpm_linux_arm64"
      sha256 "e85eec6c4308f7919dd5b2c1fa7b682b8a334b345f1df2163198ec311e66949c"
    end

    on_intel do
      url "https://github.com/JakubKontra/claude-profile-manager/releases/download/v0.1.1/cpm_linux_amd64"
      sha256 "10bb44b9ea1c6f5c342d8712e1d562d13dbfacde87d85259163ddaa03572a188"
    end
  end

  def install
    cpu = Hardware::CPU.arm? ? "arm64" : "amd64"
    os = OS.mac? ? "darwin" : "linux"
    bin.install "cpm_#{os}_#{cpu}" => "cpm"
  end

  test do
    system "#{bin}/cpm", "version"
  end
end
