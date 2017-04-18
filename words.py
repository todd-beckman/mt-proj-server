import string


class Tree():
    def __init__(self):
        
        self.root = Node(0, '')
        self.cursor = self.root
        self.nid = 0

    def findNode(self, nid):
        for n in self.root.inorder():
            if n.nid == nid:
                return n

    def add(self, cursor_nid, val): #returns the nid of the new node
        #print repr('Adding %s at %s' % (val, cursor_nid))
        p = self.findNode(cursor_nid)
        assert p is not None, "Couldn't find node %s" % cursor_nid
        n = Node(self.newNid(), val, parent=p)
        p.addChild(n)
        return n.nid

    def render(self):
        s = []
        for n in self.root.inorder():
            s.append((n.sum_val(), n.nid))
        return s

    def getStr(self):
        s = self.render()
        clean = ''
        for k in s:
            clean += k[0]
        return clean
    
    def newNid(self):
        self.nid += 1
        return self.nid

    def getpid(self, ccount):
        inor = self.root.inorder()
        s = ''
        for k in inor:
            s += k.sum_val()
            if len(s) == ccount:
                return k.nid
        return -1




class Node():
    def __init__(self, nid, val, parent=None, children=[]):
        self.nid = nid
        self.val = val
        self.parent = parent
        self.children = children

    def addChild(self, nod):
        self.children = [nod] + self.children

    def __str__(self):
        return '(%s, %s)' % (self.nid, self.val)

    def __repr__(self):
        return str(self)

    def sum_val(self):
        if not self.val in string.printable:
            return ''
        for c in self.children:
            if c.val == '\b' or c.val == '\x7f':
                return ''
        else:
            return self.val

    def inorder(self):
        yield self
        for c in self.children:
            for k in c.inorder():
                yield k


# t = Tree()
# n = t.add(0, 'h')
# n = t.add(1, 'e')
# n = t.add(2, 'l')
# n = t.add(3, 'l')
# n = t.add(4, 'o')

# print t.getStr()

# n = t.add(n, '\b')
# n = t.add(1, '\b')



# print t.getStr()










