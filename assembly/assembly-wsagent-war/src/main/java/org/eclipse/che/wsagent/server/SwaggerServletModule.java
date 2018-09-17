/*
 * Copyright (c) 2012-2018 Red Hat, Inc.
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Red Hat, Inc. - initial API and implementation
 */
package org.eclipse.che.wsagent.server;

import com.google.common.collect.ImmutableMap;
import com.google.inject.servlet.ServletModule;
import org.eclipse.che.inject.DynaModule;

/** @author Sergii Kabashniuk */
@DynaModule
public class SwaggerServletModule extends ServletModule {
  @Override
  protected void configureServlets() {
    bind(io.swagger.jaxrs.config.DefaultJaxrsConfig.class).asEagerSingleton();
    install(new org.eclipse.che.swagger.deploy.DocsModule());
    serve("/swaggerinit")
        .with(
            io.swagger.jaxrs.config.DefaultJaxrsConfig.class,
            ImmutableMap.of(
                "api.version", "1.0",
                "swagger.api.title", "Eclipse Che",
                "swagger.api.basepath", "/api"));
  }
}
