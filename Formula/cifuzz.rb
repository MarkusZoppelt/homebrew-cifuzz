class Cifuzz < Formula
  desc "CLI that helps you to integrate and run fuzzing based tests"
  homepage "https://docs.code-intelligence.com/ci-fuzz/ci-fuzz-overview"
  url "https://github.com/CodeIntelligenceTesting/cifuzz/archive/refs/tags/v0.37.2.tar.gz"
  sha256 "7daa0f5d5ae64b768d0022125081cbb4a833f3ce3418a9124fd0e9fbdc3bb25b"
  license "Apache-2.0"
  head "https://github.com/CodeIntelligenceTesting/cifuzz.git"

  depends_on "go" => :build

  def install
    system "go", "run", "tools/builder/builder.go", "--version", "0.37.2"
    system "go", "run", "-tags", "installer", "cmd/installer/installer.go", "--install-dir", prefix.to_s
  end

  test do
    system "#{bin}/cifuzz", "--version"
  end
end
