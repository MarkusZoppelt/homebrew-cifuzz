class Cifuzz < Formula
  desc "CLI that helps you to integrate and run fuzzing based tests"
  homepage "https://docs.code-intelligence.com/ci-fuzz"
  url "https://github.com/CodeIntelligenceTesting/cifuzz/archive/refs/tags/v0.28.0.tar.gz"
  sha256 "4047ac46ee34a1e5c6d26960783106f0c15cb29eb59f5c3811bd78a4ee31c2fa"
  license "Apache-2.0"
  head "https://github.com/CodeIntelligenceTesting/cifuzz.git"

  depends_on "go" => :build

  def install
    system "go", "run", "tools/builder/builder.go", "--version", "0.28.0"
    system "go", "run", "-tags", "installer", "cmd/installer/installer.go", "--install-dir", prefix.to_s
  end

  test do
    system "#{bin}/cifuzz", "--version"
  end
end
