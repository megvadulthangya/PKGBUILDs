V=20230719

PREFIX = /usr
TRUSTED= $(shell cat manjaro-trusted | cut -d: -f1)
REVOKED= $(shell cat manjaro-revoked)

update:
	gpg --recv-keys $(TRUSTED) $(REVOKED)
	gpg --export --armor $(TRUSTED) $(REVOKED) > manjaro.gpg

install:
	install -dm755 $(DESTDIR)$(PREFIX)/share/pacman/keyrings/
	install -m0644 manjaro{.gpg,-trusted,-revoked} $(DESTDIR)$(PREFIX)/share/pacman/keyrings/

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/share/pacman/keyrings/manjaro{.gpg,-trusted,-revoked}
	rmdir -p --ignore-fail-on-non-empty $(DESTDIR)$(PREFIX)/share/pacman/keyrings/
