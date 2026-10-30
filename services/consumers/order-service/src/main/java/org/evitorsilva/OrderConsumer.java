package org.evitorsilva;

import jakarta.enterprise.context.ApplicationScoped;
import org.eclipse.microprofile.reactive.messaging.Incoming;

@ApplicationScoped
public class OrderConsumer {

    @Incoming("order-in")
    public void consumirMensagem(String payload) {
        System.out.println("Recebido: " + payload);
    }
}