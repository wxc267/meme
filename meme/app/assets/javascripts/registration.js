function DateSelector(selYear, selMonth, selDay)
{
    this.selYear = selYear;
    this.selMonth = selMonth;
    this.selDay = selDay;
    this.InitYearSelect();
    this.InitMonthSelect();
    this.InitDaySelect();
    this.selYear.Group = this;
    this.selMonth.Group = this;
    this.selYear.addEventListener("change", DateSelector.Onchange, false);
    this.selMonth.addEventListener("change", DateSelector.Onchange, false);
}

//set up the min and max year number
DateSelector.prototype.MinYear = 1900;
DateSelector.prototype.MaxYear = new Date().getFullYear();

//initialize year
DateSelector.prototype.InitYearSelect = function()
{
    for(var i = this.MaxYear; i >= this.MinYear; i--)
    {
        var op = window.document.createElement("OPTION");
        //option value
        op.value = i;
        //option content
        op.innerHTML = i;
        //add to drop-down box of year
        this.selYear.appendChild(op);
    }
}

//initialize month
DateSelector.prototype.InitMonthSelect = function()
{
    for(var i = 1; i < 13; i++)
    {
        var op = window.document.createElement("OPTION");
        //option value
        op.value = i;
        //option content
        op.innerHTML = i;
        //add to drop-down box of month
        this.selMonth.appendChild(op);
    }
}

//get number of days
DateSelector.DaysInMonth = function(year, month)
{
    var date = new Date(year, month, 0);
    return date.getDate();
}

//initialize day
DateSelector.prototype.InitDaySelect = function()
{
    //get selected year and month 
    var year = parseInt(this.selYear.value);
    var month = parseInt(this.selMonth.value);
    
    //get number of days in current slected year and month
    var daysInMonth = DateSelector.DaysInMonth(year, month);
    
    //clear
    this.selDay.options.length = 0;

    for(var i = 1; i <= daysInMonth ; i++)
    {

        var op = window.document.createElement("OPTION");
        
        //option value
        op.value = i;
        //option content
        op.innerHTML = i;
        //add to drop-down box of day
        this.selDay.appendChild(op);
    }
}

DateSelector.Onchange = function(e)
{
    var selector = window.document.all != null ? e.srcElement : e.target;
    selector.Group.InitDaySelect();
}

function textCheck(){

    var username=window.document.getElementById("username");
    var password=window.document.getElementById("password"); 
    var password2=window.document.getElementById("password2");   
    if(username.value==""){  
        alert("You must have a username!");  
        username.focus();
        return false;  
    }
    if(password.value==""){  
        alert("You must have a password!");
        password.focus();  
        return false;  
    }
    if(password.value!=password2.value){  
        alert("The two passwords you typed do not match!");
        password2.focus(); 
        return false;  
    }  
}  
