/* -*-c++ -*- */

#ifndef ut_implicit_base_h
#define ut_implicit_base_h

class utImplicitBase;
class utImplicitBaseItr;

class utMapletBase {
public:
  utMapletBase() : next_(0) {}
  ~utMapletBase() {}
  utMapletBase* next() { return next_; }

private:
friend class utImplicitBase;
friend class utImplicitBaseItr;

  utMapletBase* next_;
};

class utImplicitBase {
public:
  utImplicitBase();
  virtual ~utImplicitBase();

  void attach(utMapletBase* m);
  void detach(const utMapletBase& m);
  void clear();

protected:
  virtual int cmp_node(const utMapletBase* m1,
		       const utMapletBase* m2) const = 0;
  virtual void remove_node(utMapletBase* m) = 0;

  utMapletBase* last_;

private:
friend class utImplicitBaseItr;

  utImplicitBase(const utImplicitBase&);
  utImplicitBase& operator=(const utImplicitBase&);
};

class utImplicitBaseItr {
public:
  utImplicitBaseItr(const utImplicitBase& i)
    : impl_(i), current_(i.last_) {}
  ~utImplicitBaseItr() {}
  utMapletBase* next()
    {
      utMapletBase* m = current_ ? (current_ = current_->next_) : 0;
      if (current_ == impl_.last_) current_  = 0;
      return m;
    }
  void reset()
    {
      current_ = impl_.last_;
    }

private:
  const utImplicitBase& impl_;
  utMapletBase* current_;
};

#endif /* ut_implicit_base_h */
