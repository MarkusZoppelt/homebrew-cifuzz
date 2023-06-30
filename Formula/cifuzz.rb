class Cifuzz < Formula
  desc "CLI that helps you to integrate and run fuzzing based tests"
  homepage "https://docs.code-intelligence.com/ci-fuzz/ci-fuzz-overview"
  url "https://github.com/CodeIntelligenceTesting/cifuzz/archive/refs/tags/v0.38.1.tar.gz"
  sha256 "1a11f2e6d9800051d66e325e1c3f45e92b5247d246789229e72937e936b7472d"
  license "Apache-2.0"
  head "https://github.com/CodeIntelligenceTesting/cifuzz.git"

  depends_on "go" => :build

  def install
    system "go", "run", "tools/builder/builder.go", "--version", "0.38.1"
    system "go", "run", "-tags", "installer", "cmd/installer/installer.go", "--install-dir", prefix.to_s
  end

  test do
    system "#{bin}/cifuzz", "--version"
  end
end
