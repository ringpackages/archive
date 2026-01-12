load "archive.ring"
load "stdlibcore.ring"

# Create a test archive first
write("test1.txt", "Test file 1 content")
write("test2.txt", "Test file 2 content")
archive_create("test_archive.tar.gz", ["test1.txt", "test2.txt"], 
               ARCHIVE_FORMAT_TAR, ARCHIVE_COMPRESSION_GZIP)

if archive_extract("test_archive.tar.gz", "./extracted")
    ? "Extraction successful"
else
    ? "Extraction failed"
ok

# Cleanup
remove("test1.txt")
remove("test2.txt")
remove("test_archive.tar.gz")
OSDeleteFolder("extracted")
