#ifndef C2_CNRVisitor_H
#define C2_CNRVisitor_H

class CNR;
class CNR_HarvestRatio;
class CNR_SeasonLength;
class CNR_ReportedEncounter;
class CNR_WildAssGuess;

class cnrVisitor {

 public:

  virtual ~cnrVisitor() {}

  virtual void Visit(CNR_HarvestRatio *cnr) = 0;
  virtual void Visit(CNR_SeasonLength *cnr) = 0;
  virtual void Visit(CNR_WildAssGuess *cnr) = 0;
  virtual void Visit(CNR_ReportedEncounter *cnr) = 0;
  virtual void set_year(const int year)
    {_year = year;}

 protected:
  
  cnrVisitor(){}
  CNR *cnr_;

 private:


  int _year;

};


#endif





