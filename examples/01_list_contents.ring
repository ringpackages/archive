load "archive.ring"

# Create a test archive first
write("test1.txt", "Test file 1")
write("test2.txt", "Test file 2")
archive_create("test_archive.tar.gz", ["test1.txt", "test2.txt"], 
               ARCHIVE_FORMAT_TAR, ARCHIVE_COMPRESSION_GZIP)

aEntries = archive_list("test_archive.tar.gz")

for entry in aEntries
    ? entry[1]
next

# Cleanup
remove("test1.txt")
remove("test2.txt")
remove("test_archive.tar.gz")
