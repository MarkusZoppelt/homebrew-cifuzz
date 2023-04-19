class Cifuzz < Formula
  desc "CLI that helps you to integrate and run fuzzing based tests"
  homepage "https://docs.code-intelligence.com/ci-fuzz"
  url "https://github.com/CodeIntelligenceTesting/cifuzz/archive/refs/tags/v0.27.0.tar.gz"
  sha256 "ee604373c72e5ef7539636e144a6dc874820b2bc93b0f274f33df5f0561fe0ff"
  license "Apache-2.0"
  head "https://github.com/CodeIntelligenceTesting/cifuzz.git"

  depends_on "go" => :build

  def install
    system "go", "run", "tools/builder/builder.go", "--version", "0.27.0"
    system "go", "run", "-tags", "installer", "cmd/installer/installer.go", "--install-dir", prefix.to_s
  end

  test do
    system "#{bin}/cifuzz", "--version"
  end
end
