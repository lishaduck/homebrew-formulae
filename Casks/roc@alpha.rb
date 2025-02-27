cask "roc@alpha" do
  arch arm: "aarch64", intel: "x86-64"
  architecture = on_arch_conditional arm: "apple_silicon", intel: "x86_64"

  version :latest
  sha256 :no_check

  url "https://github.com/roc-lang/roc/releases/download/alpha3-rolling/roc-macos_#{architecture}-alpha3-rolling.tar.gz",
      verified: "github.com/roc-lang/roc/"
  name "Roc"
  desc "Fast, friendly, functional language"
  homepage "https://roc-lang.org/"

  depends_on macos: ">= :ventura"
  depends_on formula: "zstd"

  binary "roc"
  binary "roc_language_server"

  preflight do
    # FIXME: Move roc-macos_#{architecture}-YYYY-MM-DD-hash/* to .
  end

  zap trash: "~/.cache/roc"
end
