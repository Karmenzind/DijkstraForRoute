from heapq import heapify, heappush, heappop

class PriorityQueue(dict):
    
    def __init__(self, *args, **kwargs):
        super(self.__class__, self).__init__(*args, **kwargs)
        self._rebuild_heap()

    def _rebuild_heap(self):
        self_iter = self.iteritems()
        self._heap = []
        for k, v in self_iter:
            self._heap.append((v, k))
        heapify(self._heap)

    def smallest(self):
        """
        Return the item with the lowest priority.
        Raises IndexError if the object is empty.
        """
        heap = self._heap
        v, k = heap[0]
        while k not in self or self[k] != v:
            heappop(heap)
            v, k = heap[0]
        return k

    def pop_smallest(self):
        """
        Return the item with the lowest priority and remove it.
        Raises IndexError if the object is empty.
        """
        heap = self._heap
        v, k = heappop(heap)
        while k not in self or self[k] != v:
            v, k = heappop(heap)
        del self[k]
        return k

    def __setitem__(self, key, val):
        super(self.__class__, self).__setitem__(key, val)
        
        if len(self._heap) < 2 * len(self):
            heappush(self._heap, (val, key))
        else:
            # When the heap grows larger than 2 * len(self), rebuild it
            self._rebuild_heap()

    def setdefault(self, key, val):
        if key not in self:
            self[key] = val
            return val
        return self[key]

    def update(self, *args, **kwargs):

        super(self.__class__, self).update(*args, **kwargs)
        self._rebuild_heap()

    def sorted_iter(self):
        """
        Sorted iterator of the priority dictionary items.
        Beware: this will destroy elements as they are returned.
        """
        while self:
            yield self.pop_smallest()