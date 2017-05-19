package main

import (
	mt "github.com/todd-beckman/mt-proj-server/gen-go/mt_gen"
)

type MTProjHandler struct {
}

func NewMTProj() *MTProjHandler {
	return &MTProjHandler{}
}

func (mtproj *MTProjHandler) Ping() (err error) {
	return err
}

func (mtproj *MTProjHandler) GetProjectListForUser(context *mt.Context) (projects map[string]*mt.Project, err error) {
	return projects, err
}

func (mtproj *MTProjHandler) GetFileTreeForProject(context *mt.Context, projectId string) (root *mt.FileMeta, err error) {
	return root, err
}

func (mtproj *MTProjHandler) GetFileContent(context *mt.Context, fileId string) (content string, err error) {
	return content, err
}
