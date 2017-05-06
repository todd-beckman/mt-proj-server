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
}

service MTProj {
    void ping()


}