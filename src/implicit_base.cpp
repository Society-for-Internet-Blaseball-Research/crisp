#include "implicit_base.h"

utImplicitBase::utImplicitBase()
: last_(0)
{}

utImplicitBase::~utImplicitBase()
{}

void utImplicitBase::attach(utMapletBase* m)
{
  if (last_) {
    m->next_ = last_->next_;
    last_->next_ = m;
  }
  else
    m->next_ = m;

  last_ = m;
}

void utImplicitBase::detach(const utMapletBase& m)
{
  utMapletBase* l;
  utMapletBase* prev;
  utMapletBase* h;
  utMapletBase* next;

  if (last_ == 0) return;

  l = h = last_->next_;		// save head of list in h and NULL terminate
  last_->next_ = 0;
  prev = 0;
  while (l) {
    next = l->next_;
    if (cmp_node(&m, l)) {		// deleting link
      remove_node(l);
      if (prev)
	prev->next_ = next;
      if (l == h)		// head of list deleted, move to next link
	h = next;
    }
    else
      prev = l;

    l = next;
  }
  if (last_ = prev)		// back into circular list
    last_->next_ = h;
}

void utImplicitBase::clear()
{
  if (last_ == 0) return;

  utMapletBase* n;
  utMapletBase* l;

  l = last_->next_;
  last_->next_ = 0;
  while (l) {
    n = l->next_;
    remove_node(l);
    l = n;
  }
  last_ = 0;
}
