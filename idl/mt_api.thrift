enum FileType {
    DIRECTORY
    DOCUMENT
}

struct Project {
    1: string id
    2: string name
}

struct FileMeta {
    1: string id
    2: string projectId
    3: FileType type
    4: string name
    5: list<FileMeta> children
}

struct Context {
    1: string correlationId
    2: string userId
}

service MTProj {
    void ping()

    // Step 1 -- collect metadata for projects available
    map<string,Project> getProjectListForUser(1: Context context) // TODO: throws SomeError

    // Step 2 -- collect metadata for files in a project
    FileMeta getFileTreeForProject(1: Context context, 2: string projectId) // TODO: throws SomeError

    // Step 3 -- get the contents of a file
    // TODO: Returns a string for now but will eventually need to be a tree
    string getFileContent(1: Context context, 2: string fileId) // TODO: throws SomeError
}
