(defvar myPackages
  '(better-defaults
    elpy
    projectile
    py-autopep8
    exec-path-from-shell
    multiple-cursors
    material-theme))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

(require 'multiple-cursors)
