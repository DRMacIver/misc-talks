from mako.template import Template
import sys

if __name__ == '__main__':
    source = sys.argv[1]
    target = sys.argv[2]


    kwargs = dict(globals())
    kwargs["__file__"] = source

    rendered = Template(filename=source, strict_undefined=True).render(**kwargs)

    with open(target, 'w') as o:
        o.write(rendered)
