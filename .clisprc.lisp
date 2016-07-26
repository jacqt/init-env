
;;; The following lines added by ql:add-to-init-file:
#-quicklisp
(let ((quicklisp-init (merge-pathnames "quicklisp/setup.lisp" (user-homedir-pathname))))
  (when (probe-file quicklisp-init)
    (load quicklisp-init)))

(setf *suppress-similar-constant-redefinition-warning* T)

;; function to make deving this init file easier.
(defun reinit ()
  (load "~/.clisprc.lisp"))

(defun load-scripting-env ()
  (load "~/clisp-env/scripting.lisp"))

(defmacro -> (fvalue &rest body)
  "Clojure threading -> macro"
  (if (equal nil body)
    `,fvalue
    `(-> (apply #',(first (first body)) ,fvalue ',(rest (first body))) ,@(rest body))))

(defmacro fn (args &rest body)
  "Allows destructuring of lambda arguments"
  (let ((symbols (map 'list #'(lambda (arg) (gentemp)) args)))
    `(lambda
       ,symbols
       ,(foldr
          #'(lambda (acc-expr next-arg)
              (destructuring-bind (sym arg) next-arg
                (if (listp arg)
                  `(destructuring-bind ,arg ,sym ,acc-expr)
                  `(let ((,arg ,sym)) ,acc-expr))))
          `(progn ,@body)
          (zip symbols `,args)))))

(defmacro infix ((lhs infix-func rhs))
  "Allows binary infix notation"
  `(,infix-func
     ,(if (and (not (equal nil lhs)) (listp lhs) (eq 3 (length lhs)))
        `(infix ,lhs)
        lhs)
     ,(if (and (not (equal nil rhs)) (listp rhs) (eq 3 (length rhs)))
        `(infix ,rhs)
        rhs)))

(defun & (func &rest args)
  "Partial application of functions"
  (lambda (&rest more-args)
    (apply func (append args more-args))))

(defun show (v)
  "Haskell show prelude to convert a value to a string"
  (format nil "~A" v))

(defun zip (list1 list2)
  "Haskell prelude zip"
  (mapcar 'list list1 list2))

(defun foldr (reducer init-value)
  "Haskell prelude foldr"
  (reduce
    reducer
    (cons init-value vals))) 

(defun empty? (vals)
  (equal '() vals))

(defun take (n vals)
  (if (or (empty? vals) (= 0 n))
    '()
    (cons (first vals) (take (- n 1) (rest vals)))))

(defun drop (n vals)
  (if (or (empty? vals) (= 0 n))
    vals
    (drop (- n 1) (rest vals))))

(defun drop-while (bool-func vals)
  (if (or (not (funcall bool-func (first vals))) (empty? vals))
    vals
    (drop-while bool-func (rest vals))))

(defun str (&rest args)
  "Clojure str function"
  (let ((args (mapcar 'show args)))
    (apply 'string-concat args)))

(defun range (start end inc)
  "Clojure range function"
  (if (>= start end)
    ()
    (cons start (range (+ start inc) end inc))))

(defun nil? (v)
  (equal nil v))
