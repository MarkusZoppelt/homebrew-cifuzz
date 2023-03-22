class Cifuzz < Formula
  desc "CLI that helps you to integrate and run fuzzing based tests"
  homepage "https://docs.code-intelligence.com/ci-fuzz"
  url "https://github.com/CodeIntelligenceTesting/cifuzz/archive/refs/tags/v0.24.0.tar.gz"
  sha256 "e14fbeabba5bbe4ca953c65d3576b0449ebde44c8cd10c49b8ccc3c4babf3dfd"
  license "Apache-2.0"
  head "https://github.com/CodeIntelligenceTesting/cifuzz.git"
  version "0.24.0"

  depends_on "go" => :build

  def install
    system "go", "run", "tools/builder/builder.go", "--version", "0.24.0"
    system "go", "run", "-tags", "installer", "cmd/installer/installer.go", "--install-dir", prefix.to_s
  end

  test do
    system "#{bin}/cifuzz", "--version"
  end
end
