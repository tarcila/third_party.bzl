load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive", "http_file")

def brotli_repository():
    # Brotli packaging is missing a necessary file.
    # Grab it and expose it so the package can be built
    http_file(
        name = "brotli_c_common_dictionary_bin",
        downloaded_file_path = "c/common/dictionary.bin",
        urls = ["https://github.com/google/brotli/blob/e61745a6b7add50d380cfd7d3883dd6c62fc2c71/c/common/dictionary.bin"],
        sha256 = "",

    )

    maybe(
        http_archive,
        name = "brotli",
        urls = ["https://github.com/google/brotli/archive/v1.0.9.zip"],
        strip_prefix = "brotli-1.0.9/",
        sha256 = "fe20057c1e5c4d0b4bd318732c0bcf330b4326b486419caf1b91c351a53c5599",
        patches = ["@third_party//brotli:0001-Workaround-warning-as-error.patch"],
        patch_args = ["-p1"],
    )
