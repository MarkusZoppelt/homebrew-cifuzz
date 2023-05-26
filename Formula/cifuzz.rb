class Cifuzz < Formula
  desc "CLI that helps you to integrate and run fuzzing based tests"
  homepage "https://docs.code-intelligence.com/ci-fuzz/ci-fuzz-overview"
  url "https://github.com/CodeIntelligenceTesting/cifuzz/archive/refs/tags/v0.31.0.tar.gz"
  sha256 "927aee0e3bf4ff9f177ecac09055f7cab6713c2c8a1dc29c1923baf86c7a702b"
  license "Apache-2.0"
  head "https://github.com/CodeIntelligenceTesting/cifuzz.git"

  depends_on "go" => :build

  def install
    system "go", "run", "tools/builder/builder.go", "--version", "0.31.0"
    system "go", "run", "-tags", "installer", "cmd/installer/installer.go", "--install-dir", prefix.to_s
  end

  test do
    system "#{bin}/cifuzz", "--version"
  end
end
