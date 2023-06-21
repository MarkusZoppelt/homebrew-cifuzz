class Cifuzz < Formula
  desc "CLI that helps you to integrate and run fuzzing based tests"
  homepage "https://docs.code-intelligence.com/ci-fuzz/ci-fuzz-overview"
  url "https://github.com/CodeIntelligenceTesting/cifuzz/archive/refs/tags/v0.35.0.tar.gz"
  sha256 "96f5070e316960aaec72f9151512c91824bd94acd1816c4d71d45f9597421eda"
  license "Apache-2.0"
  head "https://github.com/CodeIntelligenceTesting/cifuzz.git"

  depends_on "go" => :build

  def install
    system "go", "run", "tools/builder/builder.go", "--version", "0.35.0"
    system "go", "run", "-tags", "installer", "cmd/installer/installer.go", "--install-dir", prefix.to_s
  end

  test do
    system "#{bin}/cifuzz", "--version"
  end
end
