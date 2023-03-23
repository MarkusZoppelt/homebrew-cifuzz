class Cifuzz < Formula
  desc "CLI that helps you to integrate and run fuzzing based tests"
  homepage "https://docs.code-intelligence.com/ci-fuzz"
  url "https://github.com/CodeIntelligenceTesting/cifuzz/archive/refs/tags/v0.25.1.tar.gz"
  sha256 "6b9ee0f929d7de5b5013da58374f89df1e7481f2ac8090423bbaeea485453506"
  license "Apache-2.0"
  head "https://github.com/CodeIntelligenceTesting/cifuzz.git"

  depends_on "go" => :build

  def install
    system "go", "run", "tools/builder/builder.go", "--version", "0.25.1"
    system "go", "run", "-tags", "installer", "cmd/installer/installer.go", "--install-dir", prefix.to_s
  end

  test do
    system "#{bin}/cifuzz", "--version"
  end
end
