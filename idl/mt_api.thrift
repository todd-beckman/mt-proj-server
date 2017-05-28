enum FileType {
    DIRECTORY
    DOCUMENT
}

struct Project {
    1: string id
    2: string displayName
}

struct FileMeta {
    1: string id
    2: string projectId
    3: FileType type
    4: string displayName
    5: list<FileMeta> children
}

struct Context {
    1: string correlationId
    2: string userId
}

service MTProj {
    void ping()

    map<string,Project> getProjectListForUser(1: Context context) // TODO: throws SomeError

    Project getProjectMeta(1: Context context, 2: string projectId) // TODO: throws SomeError

    FileMeta getFileTreeForProject(1: Context context, 2: string projectId) // TODO: throws SomeError

    // TODO: Returns a string for now but will eventually need to be a tree
    string getFileContent(1: Context context, 2: string fileId) // TODO: throws SomeError
}
