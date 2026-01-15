load "archive.ring"

writer = new ArchiveWriter(ARCHIVE_FORMAT_TAR, ARCHIVE_COMPRESSION_GZIP)
writer.open("with_symlink.tar.gz")

writer.addFile("original.txt", "Original content")
writer.addSymlink("link.txt", "original.txt")

writer.close()

? "Created with_symlink.tar.gz"

# Cleanup
remove("with_symlink.tar.gz")
