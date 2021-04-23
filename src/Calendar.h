// calendar base class

#ifndef CALENDAR_H
#define CALENDAR_H

/*
 * the Calendar class is a base class for the tactics and config 
 * classes.  It contains some static data shared by all the subclass
 * objects.  
 *
 * exactly one instance of the Calendar should be created, to
 * initialize the necessary data.  the public constructor enforces this.
 * this also must occur before any subclass objects are created.  the
 * protected constructor, used by the subclasses, enforces this.
 *
 * all static data is initialized to 0, for detection by the constructors.
 */

class Calendar {
public:
    Calendar(const int nyrs, const int base, const int sim);
    void set_year(const int yr) { cur_year = yr; }

    int nyears() const { return num_years; }
    int base_year() const { return base_cal_year; }
    int sim_start_year() const { return base_sim_year; } 
    
protected:
    // ctor for subclasses
    Calendar();
    unsigned int year() const { return cur_year; }

private:
    static unsigned int num_years;	// total number years in simulation
    static unsigned int base_cal_year;	// base calendar year
    static unsigned int base_sim_year;  // year index of sim start year
    static unsigned int cur_year;	// current year
};

#endif
