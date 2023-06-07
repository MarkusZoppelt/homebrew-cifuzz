class Cifuzz < Formula
  desc "CLI that helps you to integrate and run fuzzing based tests"
  homepage "https://docs.code-intelligence.com/ci-fuzz/ci-fuzz-overview"
  url "https://github.com/CodeIntelligenceTesting/cifuzz/archive/refs/tags/v0.33.0.tar.gz"
  sha256 "0506cef07add0698e5c86e5de95ae95125479aebe8e6bc4c546ef5ded3ae957e"
  license "Apache-2.0"
  head "https://github.com/CodeIntelligenceTesting/cifuzz.git"

  depends_on "go" => :build

  def install
    system "go", "run", "tools/builder/builder.go", "--version", "0.33.0"
    system "go", "run", "-tags", "installer", "cmd/installer/installer.go", "--install-dir", prefix.to_s
  end

  test do
    system "#{bin}/cifuzz", "--version"
  end
end
