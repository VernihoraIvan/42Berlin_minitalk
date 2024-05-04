# minitalk (42Berlin - 42Cursus) <img src="https://github.com/devicons/devicon/blob/master/icons/linux/linux-original.svg" title="Linux" alt="Linux Logo" width="50" height="60" align="right" /> <img src="https://github.com/devicons/devicon/blob/master/icons/c/c-original.svg" title="C" alt="C Logo" width="55" height="55" align="right" />&nbsp; 

The purpose of this project is to code a small data exchange program using UNIX signals.

### Installing and running the project:

1- Clone this repository
	
	git clone https://github.com/VernihoraIvan/42Berlin_minitalk.git
2- Run `make bonus`
3- Run the server and copy its PID to the client alongside the message you want to send.
	./server
	./client <server_PID> <message>

 #### Makefile Available Targets:  
`make` or `make all` - Makes _client_ and _server_  
`make clean` - Deletes all the resulting object files  
`make fclean` - Deletes the executables and all the resulting object files  
`make re` - fclean + all  
`make bonus` - same as `all`, added for subject purposes  

# What is signal?

A signal is an event which is generated to notify a process or thread that some important situation has arrived. When a process or thread has received a signal, the process or thread will stop what its doing and take some action. Signal may be useful for inter-process communication.

## Standard Signals

The signals are defined in the header file signal.h as a macro constant. Signal name has started with a “SIG” and followed by a short description of the signal. So, every signal has a unique numeric value. Your program should always use the name of the signals, not the signals number. The reason is signal number can differ according to system but meaning of names will be standard.

The macro NSIG is the total number of signal defined. The value of NSIG is one greater than the total number of signal defined (All signal numbers are allocated consecutively).

Source: https://linuxhint.com/signal_handlers_c_programming_language/

# Signal Handling

The signal() call takes two parameters: the signal in question, and an action to take when that signal is raised.

The action can be one of three things:

- A pointer to a handler function.
- SIG_IGN to ignore the signal.
- SIG_DFL to restore the default handler for the signal.

## Writing Signal Handlers

I mentioned you could also write a handler function that gets called with the signal is raised.

These are pretty straightforward, are also very capability-limited when it comes to the spec.

Before we start, let’s look at the function prototype for the signal() call:

```
void (*signal(int sig, void (*func)(int)))(int);
```

Pretty easy to read, right?

WRONG! :)

Let’s take a moment to take it apart for practice.

signal() takes two arguments: an integer sig representing the signal, and a pointer func to the handler (the handler returns void and takes an int as an argument), highlighted below:

```
                sig          func
              |-----|  |---------------|
void (*signal(int sig, void (*func)(int)))(int);
```

Basically, we’re going to pass in the signal number we’re interesting in catching, and we’re going to pass a pointer to a function of the form:

```
void f(int x);
```

that will do the actual catching.

Now—what about the rest of that prototype? It’s basically all the return type. See, signal() will return whatever you passed as func on success… so that means it’s returning a pointer to a function that returns void and takes an int as an argument.

```
returned
function    indicates we're              and
returns     returning a                  that function
void        pointer to function          takes an int
|--|        |                                   |---|
void       (*signal(int sig, void (*func)(int)))(int);
```

Also, it can return SIG_ERR in case of an error.
