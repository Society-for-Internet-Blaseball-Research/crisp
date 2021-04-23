// list manager for a harvest objects.  this will probably disappear
// when templates are available.

#ifndef HARVESTLIST_H
#define HARVESTLIST_H

#include "Bool.h"

class Harvest;

// harvest node for HarvestList use only; no public members or methods

class HarvestNode {
  friend class HarvestList;
  friend class HvIter;
    
  private:    
    HarvestNode *next;
    Harvest *item;
    
    HarvestNode(Harvest *data = 0) { item = data; next = 0; }
};

typedef void (Harvest::*PHMFV)();
typedef void (Harvest::*PHMFVI)(int);
typedef Bool (Harvest::*PHMFB)() const;

class HarvestList {
  friend class HvIter;

  private:
    HarvestNode *phead;
    HarvestNode *pcur;
    // flag: delete the underlying object on node deletion?
    Bool delete_flag;			

  public:
    // constructor delflag specifies whether list item deletions are
    // destructive to underlying data
    HarvestList(Bool delflg = FALSE) :phead(0), pcur(0), delete_flag(delflg) {}
    ~HarvestList();
    int append(Harvest *item);
    void remove();
    void prune(PHMFB inactive_test);
    void traverse(PHMFV user_fn) const;
    void traverse(PHMFVI user_fn, int) const;
    Harvest *head() const
	{ HarvestList *mythis = (HarvestList*)this;
	mythis->pcur = phead; return current(); }
    Harvest *current() const { return (pcur) ? pcur->item : 0; }
    Harvest *next() const
	{ if (pcur) {
	    HarvestList *mythis = (HarvestList*)this;
	    mythis->pcur = pcur->next;
	    }
	return current(); }
    Bool at_end() const { return (pcur ? FALSE : TRUE); }
};

// iterator for a HarvestList.  similar in style to Rogue iterators.
// the iterator is undefined immediately after creation or reset, and
// must always be incremented before use.  note that the iterator
// automatically resets after walking off the end of the list.

class HvIter
{
  public:
    HvIter(const HarvestList &hv) : hvl(hv), cursor(0) {}
    ~HvIter() {}

    Harvest *key() const { return (cursor) ? cursor->item : 0; }
    void reset() { cursor = 0; }
    
    Harvest *operator++()
      { if (cursor) cursor = cursor->next; else cursor = hvl.phead;
        return key();
      }
  private:
    const HarvestList &hvl;
    HarvestNode *cursor;
};

#endif
