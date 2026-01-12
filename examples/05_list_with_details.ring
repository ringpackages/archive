load "archive.ring"

# Create a test archive first
write("file1.txt", "Content of file 1")
write("file2.txt", "Content of file 2 - longer")
archive_create("test_archive.tar.gz", ["file1.txt", "file2.txt"], 
               ARCHIVE_FORMAT_TAR, ARCHIVE_COMPRESSION_GZIP)

aEntries = archive_list("test_archive.tar.gz")

for entry in aEntries
    cPath = entry[1]
    nSize = entry[2]
    nType = entry[3]
    
    switch nType
    on ARCHIVE_ENTRY_FILE
        cType = "FILE"
    on ARCHIVE_ENTRY_DIR
        cType = "DIR "
    on ARCHIVE_ENTRY_SYMLINK
        cType = "LINK"
    other
        cType = "????"
    off
    
    ? "[" + cType + "] " + cPath + " (" + nSize + " bytes)"
next

# Cleanup
remove("file1.txt")
remove("file2.txt")
remove("test_archive.tar.gz")
