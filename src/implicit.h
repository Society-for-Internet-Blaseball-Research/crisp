/* -*-c++ -*- */

#ifndef implicit_h
#define implicit_h

#include "implicit_base.h"

/**    utImplicit0    **/

class utImplicit0;

class utMaplet0 : private utMapletBase {
public:
  utMaplet0(void* obj, void (*func)(void*))
    : obj_(obj), func_(func) {}
  void call() const
    { if (func_) (*func_)(obj_); }
private:
friend class utImplicit0;
  
  void (*func_)(void*);
  void *obj_;
};			

class utImplicit0 : private utImplicitBase {
public:
  utImplicit0() {}
  ~utImplicit0() { utImplicitBase::clear(); }
  void attach(void* obj, void (*func)(void*))
    { utImplicitBase::attach(new utMaplet0(obj, func)); }
  void detach(void* obj, void (*func)(void*))
    { utImplicitBase::detach(utMaplet0(obj, func)); }
  void notify()
    {
      utImplicitBaseItr itr(*this);
      utMaplet0 *m;

      while (m = (utMaplet0*) itr.next())
	m->call();
    }

private:
friend class utImplicitBase;

  utImplicit0(const utImplicit0&);
  utImplicit0& operator=(utImplicit0&);

  virtual int cmp_node(const utMapletBase* p1, const utMapletBase* p2) const
    {
      const utMaplet0* m1 = (const utMaplet0*) p1;
      const utMaplet0* m2 = (const utMaplet0*) p2;
      return m1->obj_ == m2->obj_ && m1->func_ == m2->func_;
    }
  virtual void remove_node(utMapletBase* p)
    {
      utMaplet0* m = (utMaplet0*) p;
      delete p;
    }
};

/**    utImplicit1<T1>    **/

template<class T1> class utImplicit1;

template<class T1>
class utMaplet1 : private utMapletBase {
public:
  utMaplet1(void* obj, void (*func)(void*, T1))
    : obj_(obj), func_(func) {}
  void call(T1 a1) const
    { if (func_) (*func_)(obj_, a1); }
private:
friend class utImplicit1<T1>;

  void *obj_;
  void (*func_)(void*, T1);
};			

template<class T1>
class utImplicit1 : private utImplicitBase {
public:
  utImplicit1() {}
  ~utImplicit1() { utImplicitBase::clear(); }
  void attach(void* obj, void (*func)(void*, T1))
    { utImplicitBase::attach(new utMaplet1<T1>(obj, func)); }
  void detach(void* obj, void (*func)(void*, T1))
    { utImplicitBase::detach(utMaplet1<T1>(obj, func)); }
  void notify(T1 a1)
    {
      utImplicitBaseItr itr(*this);
      utMaplet1<T1> *m;

      while (m = (utMaplet1<T1>*) itr.next())
	m->call(a1);
    }

private:
friend class utImplicitBase;

  utImplicit1(const utImplicit1<T1>&);
  utImplicit1<T1>& operator=(utImplicit1<T1>&);

  virtual int cmp_node(const utMapletBase* p1, const utMapletBase* p2) const
    {
      const utMaplet1<T1>* m1 = (const utMaplet1<T1>*) p1;
      const utMaplet1<T1>* m2 = (const utMaplet1<T1>*) p2;
      return m1->obj_ == m2->obj_ && m1->func_ == m2->func_;
    }
  virtual void remove_node(utMapletBase* p)
    {
      utMaplet1<T1>* m = (utMaplet1<T1>*) p;
      delete p;
    }
};

/**    utImplicit2<T1, T2>    **/

template<class T1, class T2> class utImplicit2;

template<class T1, class T2>
class utMaplet2 : private utMapletBase {
public:
  utMaplet2(void* obj, void (*func)(void*, T1, T2))
    : obj_(obj), func_(func) {}
  void call(T1 a1, T2 a2) const
    { if (func_) (*func_)(obj_, a1, a2); }
private:
friend class utImplicit2<T1, T2>;

  void *obj_;
  void (*func_)(void*, T1, T2);
};			

template<class T1, class T2>
class utImplicit2 : private utImplicitBase {
public:
  utImplicit2() {}
  ~utImplicit2() { utImplicitBase::clear(); }
  void attach(void* obj, void (*func)(void*, T1, T2))
    { utImplicitBase::attach(new utMaplet2<T1, T2>(obj, func)); }
  void detach(void* obj, void (*func)(void*, T1, T2))
    { utImplicitBase::detach(utMaplet2<T1, T2>(obj, func)); }
  void notify(T1 a1, T2 a2)
    {
      utImplicitBaseItr itr(*this);
      utMaplet2<T1, T2> *m;

      while (m = (utMaplet2<T1, T2>*) itr.next())
	m->call(a1, a2);
    }

private:
friend class utImplicitBase;

  utImplicit2(const utImplicit2<T1, T2>&);
  utImplicit2<T1, T2>& operator=(utImplicit2<T1, T2>&);

  virtual int cmp_node(const utMapletBase* p1, const utMapletBase* p2) const
    {
      const utMaplet2<T1, T2>* m1 = (const utMaplet2<T1, T2>*) p1;
      const utMaplet2<T1, T2>* m2 = (const utMaplet2<T1, T2>*) p2;
      return m1->obj_ == m2->obj_ && m1->func_ == m2->func_;
    }
  virtual void remove_node(utMapletBase* p)
    {
      utMaplet2<T1, T2>* m = (utMaplet2<T1, T2>*) p;
      delete p;
    }
};

/**    utImplicit3<T1, T2, T3>    **/

template<class T1, class T2, class T3> class utImplicit3;

template<class T1, class T2, class T3>
class utMaplet3 : private utMapletBase {
public:
  utMaplet3(void* obj, void (*func)(void*, T1, T2, T3))
    : obj_(obj), func_(func) {}
  void call(T1 a1, T2 a2, T3 a3) const
    { if (func_) (*func_)(obj_, a1, a2, a3); }
private:
friend class utImplicit3<T1, T2, T3>;

  void *obj_;
  void (*func_)(void*, T1, T2, T3);
};			

template<class T1, class T2, class T3>
class utImplicit3 : private utImplicitBase {
public:
  utImplicit3() {}
  ~utImplicit3() { utImplicitBase::clear(); }
  void attach(void* obj, void (*func)(void*, T1, T2, T3))
    { utImplicitBase::attach(new utMaplet3<T1, T2, T3>(obj, func)); }
  void detach(void* obj, void (*func)(void*, T1, T2, T3))
    { utImplicitBase::detach(utMaplet3<T1, T2, T3>(obj, func)); }
  void notify(T1 a1, T2 a2, T3 a3)
    {
      utImplicitBaseItr itr(*this);
      utMaplet3<T1, T2, T3> *m;

      while (m = (utMaplet3<T1, T2, T3>*) itr.next())
	m->call(a1, a2, a3);
    }

private:
friend class utImplicitBase;

  utImplicit3(const utImplicit3<T1, T2, T3>&);
  utImplicit3<T1, T2, T3>& operator=(utImplicit3<T1, T2, T3>&);

  virtual int cmp_node(const utMapletBase* p1, const utMapletBase* p2) const
    {
      const utMaplet3<T1, T2, T3>* m1 = (const utMaplet3<T1, T2, T3>*) p1;
      const utMaplet3<T1, T2, T3>* m2 = (const utMaplet3<T1, T2, T3>*) p2;
      return m1->obj_ == m2->obj_ && m1->func_ == m2->func_;
    }
  virtual void remove_node(utMapletBase* p)
    {
      utMaplet3<T1, T2, T3>* m = (utMaplet3<T1, T2, T3>*) p;
      delete p;
    }
};

/**    utImplicit4<T1, T2, T3, T4>    **/

template<class T1, class T2, class T3, class T4> class utImplicit4;

template<class T1, class T2, class T3, class T4>
class utMaplet4 : private utMapletBase {
public:
  utMaplet4(void* obj, void (*func)(void*, T1, T2, T3, T4))
    : obj_(obj), func_(func) {}
  void call(T1 a1, T2 a2, T3 a3, T4 a4) const
    { if (func_) (*func_)(obj_, a1, a2, a3, a4); }
private:
friend class utImplicit4<T1, T2, T3, T4>;

  void *obj_;
  void (*func_)(void*, T1, T2, T3, T4);
};			

template<class T1, class T2, class T3, class T4>
class utImplicit4 : private utImplicitBase {
public:
  utImplicit4() {}
  ~utImplicit4() { utImplicitBase::clear(); }
  void attach(void* obj, void (*func)(void*, T1, T2, T3, T4))
    { utImplicitBase::attach(new utMaplet4<T1, T2, T3, T4>(obj, func)); }
  void detach(void* obj, void (*func)(void*, T1, T2, T3, T4))
    { utImplicitBase::detach(utMaplet4<T1, T2, T3, T4>(obj, func)); }
  void notify(T1 a1, T2 a2, T3 a3, T4 a4)
    {
      utImplicitBaseItr itr(*this);
      utMaplet4<T1, T2, T3, T4> *m;

      while (m = (utMaplet4<T1, T2, T3, T4>*) itr.next())
	m->call(a1, a2, a3, a4);
    }

private:
friend class utImplicitBase;

  utImplicit4(const utImplicit4<T1, T2, T3, T4>&);
  utImplicit4<T1, T2, T3, T4>& operator=(utImplicit4<T1, T2, T3, T4>&);

  virtual int cmp_node(const utMapletBase* p1, const utMapletBase* p2) const
    {
      const utMaplet4<T1, T2, T3, T4>* m1
	= (const utMaplet4<T1, T2, T3, T4>*) p1;
      const utMaplet4<T1, T2, T3, T4>* m2 =
	(const utMaplet4<T1, T2, T3, T4>*) p2;

      return m1->obj_ == m2->obj_ && m1->func_ == m2->func_;
    }
  virtual void remove_node(utMapletBase* p)
    {
      utMaplet4<T1, T2, T3, T4>* m = (utMaplet4<T1, T2, T3, T4>*) p;
      delete p;
    }
};

/**    utImplicit5<T1, T2, T3, T4, T5>    **/

template<class T1, class T2, class T3, class T4, class T5> class utImplicit5;

template<class T1, class T2, class T3, class T4, class T5>
class utMaplet5 : private utMapletBase {
public:
  utMaplet5(void* obj, void (*func)(void*, T1, T2, T3, T4, T5))
    : obj_(obj), func_(func) {}
  void call(T1 a1, T2 a2, T3 a3, T4 a4, T5 a5) const
    { if (func_) (*func_)(obj_, a1, a2, a3, a4, a5); }
private:
friend class utImplicit5<T1, T2, T3, T4, T5>;

  void *obj_;
  void (*func_)(void*, T1, T2, T3, T4, T5);
};			

template<class T1, class T2, class T3, class T4, class T5>
class utImplicit5 : private utImplicitBase {
public:
  utImplicit5() {}
  ~utImplicit5() { utImplicitBase::clear(); }
  void attach(void* obj, void (*func)(void*, T1, T2, T3, T4, T5))
    { utImplicitBase::attach(new utMaplet5<T1, T2, T3, T4, T5>(obj, func)); }
  void detach(void* obj, void (*func)(void*, T1, T2, T3, T4, T5))
    { utImplicitBase::detach(utMaplet5<T1, T2, T3, T4, T5>(obj, func)); }
  void notify(T1 a1, T2 a2, T3 a3, T4 a4, T5 a5)
    {
      utImplicitBaseItr itr(*this);
      utMaplet5<T1, T2, T3, T4, T5> *m;

      while (m = (utMaplet5<T1, T2, T3, T4, T5>*) itr.next())
	m->call(a1, a2, a3, a4, a5);
    }

private:
friend class utImplicitBase;

  utImplicit5(const utImplicit5<T1, T2, T3, T4, T5>&);
  utImplicit5<T1, T2, T3, T4, T5>& operator=(utImplicit5<T1, T2, T3, T4, T5>&);

  virtual int cmp_node(const utMapletBase* p1, const utMapletBase* p2) const
    {
      const utMaplet5<T1, T2, T3, T4, T5>* m1
	= (const utMaplet5<T1, T2, T3, T4, T5>*) p1;
      const utMaplet5<T1, T2, T3, T4, T5>* m2 =
	(const utMaplet5<T1, T2, T3, T4, T5>*) p2;

      return m1->obj_ == m2->obj_ && m1->func_ == m2->func_;
    }
  virtual void remove_node(utMapletBase* p)
    {
      utMaplet5<T1, T2, T3, T4, T5>* m = (utMaplet5<T1, T2, T3, T4, T5>*) p;
      delete p;
    }
};

#endif /* implicit_h */
