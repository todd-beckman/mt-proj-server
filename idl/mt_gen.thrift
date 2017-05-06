enum FileType {
    DIRECTORY
    DOCUMENT
}

struct Project {
    1: string id
    2: string name
}

struct File {
    1: string id
    2: string projectId
    3: FileType type
    4: string name
    5: list<File> children
}

struct Context {
    1: string correlationId
    2: string userId
}

service MTProj {
    void ping()

    File getFileTreeForProject(1: Context context, 2: string projectId) // TODO: throws SomeError
}