// implementations for HarvestList

#include "assert.h"
#include "Harvest.h"
#include "HarvestList.h"


// deconstructor.  delete all nodes.  

HarvestList::~HarvestList()
{
    while ((pcur = phead) != 0)
	remove();
}


// append a harvest to the list.  return 0 on failure, else non-zero.
// move current to the new end.

int HarvestList::append(Harvest *item)
{
    HarvestNode *node;
    
    node = new HarvestNode(item);
    assert(node);			// alloc error?
    
    if (!phead)				// empty list
	phead = node;
    else
    {
	pcur = phead;
	while (pcur->next)
	    pcur = pcur->next;
	pcur->next = node;
    }
    pcur = node;
    return 1;
}

// remove the list entry pointed to by pcur; pcur goes to the next item
// if delete_flag == TRUE, delete the underlying object as well

void HarvestList::remove()
{
    if (!pcur) return;

    HarvestNode *new_pcur;
    if (pcur == phead)
	new_pcur = phead = phead->next;
    else
    {
    	HarvestNode *prev = phead;
	while (prev->next != pcur)
	    prev = prev->next;
	new_pcur = prev->next = pcur->next;
    }
    if (delete_flag)
	delete pcur->item;
    delete pcur;
    pcur = new_pcur;
    return;
}


// walk the tree and prune inactive items.  takes a pointer to a Harvest
// member fn to test if the Harvest is inactive.

void HarvestList::prune(PHMFB inactive_test)
{
    pcur = phead;
    while (pcur)
    {
	if ((pcur->item->*inactive_test)())
	    remove();			// automatically advances pcur
	else pcur = pcur->next;
    }
}


// walk the tree and execute a user function at each node

void HarvestList::traverse(PHMFV user_fn) const
{

    HarvestNode *node = phead;
    while (node)
    {
	if (node->item)
	    (node->item->*user_fn)();
	node = node->next;
    }
}

// same thing, with int param

void HarvestList::traverse(PHMFVI user_fn, int datum) const
{
    HarvestNode *node = phead;
    while (node)
    {
	if (node->item)
	    (node->item->*user_fn)(datum);
	node = node->next;
    }
}
